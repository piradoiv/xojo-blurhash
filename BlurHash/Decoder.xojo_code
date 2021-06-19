#tag Class
Protected Class Decoder
	#tag Method, Flags = &h0
		Shared Function Decode(hash As String, width As Integer, height As Integer, punch As Double = 1.0, linear As Boolean = False) As Picture
		  Const Pi = 3.14159265358979323846
		  
		  Var result As New Picture(width, height)
		  Var chars() As String = hash.Split("")
		  
		  Var sizeFlag As Integer = Base83.Decode(chars(0))
		  Var numY As Double = Floor(sizeFlag / 9) + 1
		  Var numX As Double = (sizeFlag Mod 9) + 1
		  
		  Var quantisedMaximumValue As Integer = Base83.Decode(chars(1))
		  Var maximumValue As Double = (quantisedMaximumValue + 1) / 166
		  
		  Var colors(-1, -1) As Integer
		  colors.ResizeTo(numX * numY, 2)
		  
		  #Pragma BackgroundTasks False
		  For i As Integer = 0 To colors.LastIndex
		    If i = 0 Then
		      Var value As Integer = Base83.Decode(hash.Left(8).Right(6))
		      colors(i, 0) = Utils.LinearTosRGB(ShiftRight(value, 16))
		      colors(i, 1) = Utils.LinearTosRGB(BitAnd((ShiftRight(value, 8)), 255))
		      colors(i, 2) = Utils.LinearTosRGB(BitAnd(value, 255))
		    Else
		      Var startAt As Integer = 4 + i * 2
		      Var amountOfChars As Integer = 6 + i * 2
		      Var chunk As String = hash.Left(startAt + amountOfChars).Right(amountOfChars)
		      Var value As Integer = Base83.Decode(chunk)
		      colors(i, 0) = Utils.LinearTosRGB(SignPow((Floor(value / (19 * 19)) - 9) / 9, 2.0) * maximumValue)
		      colors(i, 1) = Utils.LinearTosRGB(SignPow((Floor(value / 19) Mod 19 - 9) / 9, 2.0) * maximumValue)
		      colors(i, 2) = Utils.LinearTosRGB(SignPow((value Mod 19 - 9) / 9, 2.0) * maximumValue)
		    End
		  Next
		  #Pragma BackgroundTasks True
		  
		  Var pixels As RGBSurface = result.RGBSurface
		  Var r, g, b, index As Integer
		  Var basis As Double
		  
		  #Pragma BackgroundTasks False
		  For y As Integer = 0 To height - 1
		    For x As Integer = 0 To width - 1
		      r = 0
		      g = 0
		      b = 0
		      
		      For j As Integer = 0 To numY - 1
		        For i As Integer = 0 To numY - 1
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
		  #Pragma BackgroundTasks True
		  
		  Return result
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
