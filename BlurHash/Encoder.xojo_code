#tag Class
Protected Class Encoder
	#tag Method, Flags = &h0
		Function Encode(imageToEncode As Picture, componentsX As Integer = 4, componentsY As Integer = 4, linear As Boolean = False) As String
		  Var hash As String
		  Var image As New Picture(Min(imageToEncode.Width, 20), Min(imageToEncode.Height, 20))
		  image.Graphics.DrawPicture(imageToEncode, 0, 0, image.Width, image.Height, 0, 0, imageToEncode.Width, imageToEncode.Height)
		  
		  Var width As Integer = image.Width
		  Var height As Integer = image.Height
		  Var widthHeight As Integer = width * height
		  
		  Var pixels As RGBSurface = image.RGBSurface
		  
		  ' Convert to Linear
		  Var imageLinear(-1, -1, -1) As Double
		  imageLinear.ResizeTo(height, width, 2)
		  For y As Integer = 0 To height - 1
		    For x As Integer = 0 To width - 1
		      Var pixel As Color = pixels.Pixel(x, y)
		      imageLinear(y, x, 0) = ColorUtils.sRGBToLinear(pixel.Red)
		      imageLinear(y, x, 1) = ColorUtils.sRGBToLinear(pixel.Green)
		      imageLinear(y, x, 2) = ColorUtils.sRGBToLinear(pixel.Blue)
		    Next
		  Next
		  
		  ' Calculate Components
		  Var components(-1, -1) As Double
		  components.ResizeTo(componentsX * componentsY, 2)
		  
		  Var maxAcComponent As Double
		  
		  Var k As Integer = 0
		  For j As Integer = 0 To componentsY - 1
		    For i As Integer = 0 To componentsX - 1
		      Var normFactor As Double = If(i = 0 And j = 0, 1, 2)
		      Var component(2) As Double
		      Var basis As Double
		      Var r, g, b As Double
		      
		      For y As Integer = 0 To height - 1
		        For x As Integer = 0 To width - 1
		          basis = normFactor * (Cos(PI * i * x / image.Width) *_
		          Cos(PI * j * y / image.Width))
		          
		          r = imageLinear(y, x, 0)
		          g = imageLinear(y, x, 1)
		          b = imageLinear(y, x, 2)
		          
		          component(0) = component(0) + basis * r
		          component(1) = component(1) + basis * g
		          component(2) = component(2) + basis * b
		        Next
		      Next
		      
		      component(0) = component(0) / widthHeight
		      component(1) = component(1) / widthHeight
		      component(2) = component(2) / widthHeight
		      
		      components(k, 0) = component(0)
		      components(k, 1) = component(1)
		      components(k, 2) = component(2)
		      k = k + 1
		      
		      If i <> 0 And j <> 0 Then maxAcComponent = Max(maxAcComponent, Abs(component(0)), Abs(component(1)), Abs(component(2)))
		    Next
		  Next
		  
		  Var dcValue As Integer = ShiftLeft(ColorUtils.LinearTosRGB(components(0, 0)), 16) + _
		  ShiftLeft(ColorUtils.LinearTosRGB(components(0, 1)), 8) + _
		  ColorUtils.LinearTosRGB(components(0, 2))
		  
		  Var quantMaxAcComponent As Integer = Max(0, Min(82, Floor(maxAcComponent * 166 - 0.5)))
		  Var acComponentNormFactor As Double = (quantMaxAcComponent + 1) / 166
		  
		  Var acValues() As Integer
		  Var r, g, b As Double
		  For i As Integer = 1 To (componentsX * componentsY) - 1
		    r = components(i, 0)
		    g = components(i, 1)
		    b = components(i, 2)
		    acValues.Add(_
		    Max(0, Min(18, Floor(BlurHash.Math.SignPow(r / acComponentNormFactor, 0.5) * 9 + 9.5))) * 19 * 19 + _
		    Max(0, Min(18, Floor(BlurHash.Math.SignPow(g / acComponentNormFactor, 0.5) * 9 + 9.5))) * 19 + _
		    Max(0, Min(18, Floor(BlurHash.Math.SignPow(b / acComponentNormFactor, 0.5) * 9 + 9.5))))
		  Next
		  
		  hash = BlurHash.Base83.Encode((componentsX - 1) + (componentsY - 1) * 9, 1)
		  hash = hash + BlurHash.Base83.Encode(quantMaxACComponent, 1)
		  hash = hash + BlurHash.Base83.Encode(dcValue, 4)
		  For Each value As Integer In acValues
		    hash = hash + BlurHash.Base83.Encode(value, 2)
		  Next
		  
		  Return hash
		End Function
	#tag EndMethod


	#tag Constant, Name = PI, Type = Double, Dynamic = False, Default = \"3.14159265358979323846", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
