#tag Class
Protected Class Math
	#tag Method, Flags = &h0
		Shared Function SignPow(base As Double, exp As Double) As Double
		  Return Sign(base) * Pow(Abs(base), exp)
		End Function
	#tag EndMethod


End Class
#tag EndClass
