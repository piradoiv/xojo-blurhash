#tag Class
Protected Class Decoder
	#tag Method, Flags = &h0
		Shared Function Decode(hash As String, width As Integer, height As Integer, punch As Double = 1.0, linear As Boolean = False) As Picture
		  Var result As New Picture(width, height)
		  Var chars() As String = hash.Split("")
		  
		  Var sizeFlag As Integer = Base83.Decode(chars(0))
		  Var numY As Double = Floor(sizeFlag / 9) + 1
		  Var numX As Double = (sizeFlag Mod 9) + 1
		  
		  Var quantisedMaximumValue As Integer = Base83.Decode(chars(1))
		  Var maximumValue As Double = (quantisedMaximumValue + 1) / 166
		  
		  Var colors(-1, -1) As Integer
		  colors.ResizeTo(numX * numY, 2)
		  
		  For i As Integer = 0 To colors.LastIndex
		    If i = 0 Then
		      Var value As Integer = Base83.Decode(hash.Left(8).Right(6))
		      colors(i, 0) = LinearTosRGB(ShiftRight(value, 16))
		      colors(i, 1) = LinearTosRGB(BitAnd((ShiftRight(value, 8)), 255))
		      colors(i, 2) = LinearTosRGB(BitAnd(value, 255))
		    Else
		      Var startAt As Integer = 4 + i * 2
		      Var amountOfChars As Integer = 6 + i * 2
		      Var chunk As String = hash.Left(startAt + amountOfChars).Right(amountOfChars)
		      Var value As Integer = Base83.Decode(chunk)
		      colors(i, 0) = LinearTosRGB(SignPow((Floor(value / (19 * 19)) - 9) / 9, 2.0) * maximumValue)
		      colors(i, 1) = LinearTosRGB(SignPow((Floor(value / 19) Mod 19 - 9) / 9, 2.0) * maximumValue)
		      colors(i, 2) = LinearTosRGB(SignPow((value Mod 19 - 9) / 9, 2.0) * maximumValue)
		    End
		  Next
		  
		  Const Pi = 3.141596
		  
		  Var pixels As RGBSurface = result.RGBSurface
		  For y As Integer = 0 To height - 1
		    For x As Integer = 0 To width - 1
		      Var r As Integer = 0
		      Var g As Integer = 0
		      Var b As Integer = 0
		      
		      For j As Integer = 0 To numY - 1
		        For i As Integer = 0 To numY - 1
		          Var basis As Double = _
		          Cos((Pi * x * i) / width) * _
		          Cos((Pi * y * j) / height)
		          Var c(2) As Integer
		          Var index As Integer = i + j * numX
		          c(0) = colors(index, 0)
		          c(1) = colors(index, 1)
		          c(2) = colors(index, 2)
		          r = r + c(0) * basis
		          g = g + c(1) * basis
		          b = b + c(2) * basis
		        Next
		      Next
		      
		      Var c As Color = Color.RGB(r, g, b)
		      pixels.Pixel(x, y) = c
		    Next
		  Next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function LinearTosRGB(value As Double) As Integer
		  Var v As Double = Max(0, Min(1, value))
		  
		  If v <= 0.0031308 Then
		    Return Round(v * 12.92 * 255 + 0.5)
		  Else
		    Return Round((1.055 * Pow(v, 1 / 2.4) - 0.055) * 255 + 0.5)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SignPow(base As Double, exp As Double) As Double
		  Return Sign(base) * Pow(Abs(base), exp)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Spaceship(value As Double) As Integer
		  If value = 0 Then Return 0
		  Return If(value < 0, -1, 1)
		End Function
	#tag EndMethod


End Class
#tag EndClass
