#tag Class
Protected Class Decoder
	#tag Method, Flags = &h0
		Shared Function Decode(hash As String, width As Integer, height As Integer, punch As Double = 1.0, linear As Boolean = False) As Picture
		  Const Pi = 3.14159265358979323846
		  
		  Var startTime As Double = DateTime.Now.SecondsFrom1970
		  Var elapsed As Double = 0
		  
		  Var b83 As New Base83
		  Var mUtils As New Utils
		  
		  Var result As New Picture(width, height)
		  Var chars() As String = hash.Split("")
		  
		  Var sizeFlag As Integer = b83.Decode(chars(0))
		  Var numY As Double = Floor(sizeFlag / 9) + 1
		  Var numX As Double = (sizeFlag Mod 9) + 1
		  
		  Var quantisedMaximumValue As Integer = b83.Decode(chars(1))
		  Var maximumValue As Double = (quantisedMaximumValue + 1) / 166
		  
		  Var colors(-1, -1) As Integer
		  colors.ResizeTo(numX * numY, 2)
		  
		  elapsed = DateTime.Now.SecondsFrom1970 - startTime
		  System.DebugLog("Initialised in " + elapsed.ToString)
		  startTime = DateTime.Now.SecondsFrom1970
		  
		  #Pragma BackgroundTasks False
		  Var value As Integer
		  For i As Integer = 0 To colors.LastIndex
		    If i = 0 Then
		      value = b83.Decode(hash.Middle(2, 6))
		      colors(i, 0) = mUtils.LinearTosRGB(ShiftRight(value, 16))
		      colors(i, 1) = mUtils.LinearTosRGB(BitAnd((ShiftRight(value, 8)), 255))
		      colors(i, 2) = mUtils.LinearTosRGB(BitAnd(value, 255))
		    Else
		      value = b83.Decode(hash.Middle(4 + i * 2, 6 + i * 2))
		      colors(i, 0) = mUtils.LinearTosRGB(SignPow((Floor(value / (19 * 19)) - 9) / 9, 2.0) * maximumValue)
		      colors(i, 1) = mUtils.LinearTosRGB(SignPow((Floor(value / 19) Mod 19 - 9) / 9, 2.0) * maximumValue)
		      colors(i, 2) = mUtils.LinearTosRGB(SignPow((value Mod 19 - 9) / 9, 2.0) * maximumValue)
		    End
		  Next
		  #Pragma BackgroundTasks True
		  
		  elapsed = DateTime.Now.SecondsFrom1970 - startTime
		  System.DebugLog("Colors setup in " + elapsed.ToString)
		  startTime = DateTime.Now.SecondsFrom1970
		  
		  Var pixels As RGBSurface = result.RGBSurface
		  Var r, g, b, index As Integer
		  Var basis As Double
		  Var upperY As Integer = height - 1
		  Var upperX As Integer = width - 1
		  Var upperJ As Integer = numY - 1
		  Var upperI As Integer = numX - 1
		  
		  #Pragma BackgroundTasks False
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
		  #Pragma BackgroundTasks True
		  
		  elapsed = DateTime.Now.SecondsFrom1970 - startTime
		  System.DebugLog("Pixels written in " + elapsed.ToString)
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function SignPow(base As Double, exp As Double) As Double
		  Return Sign(base) * Pow(Abs(base), exp)
		End Function
	#tag EndMethod


End Class
#tag EndClass
