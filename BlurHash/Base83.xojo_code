#tag Class
Protected Class Base83
	#tag Method, Flags = &h0
		Shared Function Decode(input As String) As Integer
		  Var value As Integer = 0
		  For Each c As String In Input.Characters
		    value = value * 83 + kAlphabet.indexOf(c, ComparisonOptions.CaseSensitive)
		  Next
		  
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Encode(value As Integer, length As Integer) As String
		  Var chars() As String = kAlphabet.Split("")
		  Var result As String
		  Var digit As Integer
		  
		  For i As Integer = 1 To length
		    digit = (Floor(value) / Pow(83, length - i)) Mod 83
		    result = result + chars(digit)
		  Next
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Constant, Name = kAlphabet, Type = String, Dynamic = False, Default = \"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz#$%*+\x2C-.:;\x3D\?@[]^_{|}~", Scope = Public
	#tag EndConstant


End Class
#tag EndClass
