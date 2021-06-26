#tag Class
Protected Class Decoder
	#tag Method, Flags = &h0
		Function Decode(hash As String, width As Integer, height As Integer, punch As Double = 1.0) As Picture
		  Var result As New Picture(width, height)
		  Var chars() As String = hash.Split("")
		  
		  Var sizeFlag As Integer = BlurHash.Base83.Decode(chars(0))
		  Var sizeX As Integer = (sizeFlag Mod 9) + 1
		  Var sizeY As Integer = Round(sizeFlag / 9) + 1
		  
		  Var quantisedMaximumValue As Integer = BlurHash.Base83.Decode(chars(1))
		  Var maximumValue As Double = (quantisedMaximumValue + 1) / 166 * punch
		  Var colors(-1,-1) As Double = PrepareColors(sizeX, sizeY, maximumValue, hash)
		  
		  Var pixels As RGBSurface = result.RGBSurface
		  Var r, g, b, index As Double
		  Var basis As Double
		  
		  For y As Integer = 0 To height - 1
		    For x As Integer = 0 To width - 1
		      r = 0
		      g = 0
		      b = 0
		      
		      For j As Integer = 0 To sizeY - 1
		        For i As Integer = 0 To sizeX - 1
		          index = i + j * sizeX
		          basis = _
		          Cos((PI * x * i) / width) * _
		          Cos((PI * y * j) / height)
		          r = r + colors(index, 0) * basis
		          g = g + colors(index, 1) * basis
		          b = b + colors(index, 2) * basis
		        Next
		      Next
		      
		      pixels.Pixel(x, y) = Color.RGB(ColorUtils.LinearTosRGB(r), ColorUtils.LinearTosRGB(g), ColorUtils.LinearTosRGB(b))
		    Next
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DecodeAC(value As Double, maximumValue As Double) As Double()
		  Var quantR As Integer = Floor(value / (19 * 19))
		  Var quantG As Integer = Floor(value / 19) Mod 19
		  Var quantB As Integer = value Mod 19
		  
		  Var r As Double = BlurHash.Math.SignPow((quantR - 9) / 9, 2.0) * maximumValue
		  Var g As Double = BlurHash.Math.SignPow((quantG - 9) / 9, 2.0) * maximumValue
		  Var b As Double = BlurHash.Math.SignPow((quantB - 9) / 9, 2.0) * maximumValue
		  
		  Return Array(r, g, b)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DecodeDC(value As Double) As Double()
		  Var r As Integer = ShiftRight(value, 16)
		  Var g As Integer = BitAnd(ShiftRight(value, 8), 255)
		  Var b As Integer = BitAnd(value, 255)
		  
		  Return Array(ColorUtils.sRGBToLinear(r), ColorUtils.sRGBToLinear(g), ColorUtils.sRGBToLinear(b))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepareColors(numX As Integer, numY As integer, maximumValue As Double, hash As String) As Double(,)
		  Var colors(-1, -1) As Double
		  colors.ResizeTo(numX * numY, 2)
		  Var value As Integer
		  Var decoded() As Double
		  Var portion As String
		  
		  ' DC component
		  portion = hash.JSLikeSubstring(2, 6)
		  value = BlurHash.Base83.Decode(portion)
		  decoded = DecodeDC(value)
		  colors(0, 0) = decoded(0)
		  colors(0, 1) = decoded(1)
		  colors(0, 2) = decoded(2)
		  
		  ' AC Components
		  For component As Integer = 1 To colors.LastIndex
		    portion = hash.JSLikeSubstring(4 + component * 2, 6 + component * 2)
		    value = BlurHash.Base83.Decode(portion)
		    decoded = DecodeAC(value, maximumValue)
		    colors(component, 0) = decoded(0)
		    colors(component, 1) = decoded(1)
		    colors(component, 2) = decoded(2)
		  Next
		  
		  Return colors
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
