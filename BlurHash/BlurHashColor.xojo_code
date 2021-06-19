#tag Class
Protected Class BlurHashColor
	#tag Method, Flags = &h0
		Shared Function ToLinear(value As Integer) As Double
		  Var result As Double = value / 255
		  Return If(result <= 0.04045, result / 12.92, Pow((result + 0.055) / 1.055, 2.4))
		End Function
	#tag EndMethod


End Class
#tag EndClass
