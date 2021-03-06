#tag Class
Protected Class ColorUtils
	#tag Method, Flags = &h0
		Shared Function LinearTosRGB(value As Double) As Integer
		  Var v As Double = Max(0, Min(1, value))
		  Return If(v <= 0.0031308, _
		  v * 12.92 * 255 + 0.5, _
		  (1.055 * Pow(v, 1 / 2.4) - 0.055) * 255 + 0.5)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function sRGBToLinear(value As Double) As Double
		  Var v As Double = value / 255
		  If v <= 0.04045 Then
		    Return v / 12.92
		  Else
		    Return Pow((v + 0.055) / 1.055, 2.4)
		  End If
		End Function
	#tag EndMethod


End Class
#tag EndClass
