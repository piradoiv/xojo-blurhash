#tag Class
Protected Class Decoder
	#tag Method, Flags = &h0
		Function Decode(hash As String, width As Integer, height As Integer, punch As Double = 1.0, linear As Boolean = False) As Picture
		  Const Pi = 3.14159265358979323846
		  
		  Var result As New Picture(width, height)
		  Var chars() As String = hash.Split("")
		  
		  Var sizeFlag As Integer = DecodeBase83(chars(0))
		  Var numY As Double = Floor(sizeFlag / 9) + 1
		  Var numX As Double = (sizeFlag Mod 9) + 1
		  
		  Var quantisedMaximumValue As Integer = DecodeBase83(chars(1))
		  Var maximumValue As Double = (quantisedMaximumValue + 1) / 166
		  
		  Var colors(-1, -1) As Integer
		  colors.ResizeTo(numX * numY, 2)
		  
		  Var value As Integer
		  For i As Integer = 0 To colors.LastIndex
		    If i = 0 Then
		      value = DecodeBase83(hash.Middle(2, 6))
		      colors(i, 0) = LinearTosRGB(ShiftRight(value, 16))
		      colors(i, 1) = LinearTosRGB(BitAnd((ShiftRight(value, 8)), 255))
		      colors(i, 2) = LinearTosRGB(BitAnd(value, 255))
		    Else
		      value = DecodeBase83(hash.Middle(4 + i * 2, 6 + i * 2))
		      colors(i, 0) = LinearTosRGB(SignPow((Floor(value / (19 * 19)) - 9) / 9, 2.0) * maximumValue)
		      colors(i, 1) = LinearTosRGB(SignPow((Floor(value / 19) Mod 19 - 9) / 9, 2.0) * maximumValue)
		      colors(i, 2) = LinearTosRGB(SignPow((value Mod 19 - 9) / 9, 2.0) * maximumValue)
		    End
		  Next
		  
		  Var pixels As RGBSurface = result.RGBSurface
		  Var r, g, b, index As Integer
		  Var basis As Double
		  Var upperY As Integer = height - 1
		  Var upperX As Integer = width - 1
		  Var upperJ As Integer = numY - 1
		  Var upperI As Integer = numX - 1
		  
		  For y As Integer = 0 To upperY
		    For x As Integer = 0 To upperX
		      r = 0
		      g = 0
		      b = 0
		      
		      For j As Integer = 0 To upperJ
		        For i As Integer = 0 To upperI
		          basis = Cos((Pi * x * i) / width) * Cos((Pi * y * j) / height)
		          index = i + j * numX
		          r = r + colors(index, 0) * basis
		          g = g + colors(index, 1) * basis
		          b = b + colors(index, 2) * basis
		        Next
		      Next
		      
		      pixels.Pixel(x, y) = Color.RGB(r, g, b)
		    Next
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DecodeBase83(input As String) As Integer
		  Var value As Integer = 0
		  For Each c As String In Input.Characters
		    value = value * 83 + kAlphabet.indexOf(c)
		  Next
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LinearTosRGB(value As Double) As Integer
		  Var v As Double = Max(0, Min(1, value))
		  Return If(v <= 0.0031308, Round(v * 12.92 * 255 + 0.5), Round((1.055 * Pow(v, 1 / 2.4) - 0.055) * 255 + 0.5))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SignPow(base As Double, exp As Double) As Double
		  Return Sign(base) * Pow(Abs(base), exp)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sRGBToLinear(value As Double) As Double
		  Var v As Double = value / 255
		  If v <= 0.04045 Then
		    Return v / 12.92
		  Else
		    Return Pow((v + 0.055) / 1.055, 2.4)
		  End
		End Function
	#tag EndMethod


	#tag Constant, Name = kAlphabet, Type = String, Dynamic = False, Default = \"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#$%*+\x2C-.:;\x3D\?@[]^_{|}~", Scope = Public
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
