#tag Class
Protected Class Base83
	#tag Method, Flags = &h0
		Shared Function Decode(input As String) As Integer
		  Var alphabet() As String = Array(_
		  "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", _
		  "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", _
		  "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", _
		  "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", _
		  "u", "v", "w", "x", "y", "z", "#", "$", "%", "*", "+", ",", "-", ".", _
		  ":", ";", "=", "?", "@", "[", "]", "^", "_", "{", "|", "}", "~")
		  
		  Var result As Integer = 0
		  
		  Var chars() As String = Input.Split("")
		  For Each char As String In chars
		    result = result * 83 + alphabet.IndexOf(char)
		  Next
		  
		  Return result
		End Function
	#tag EndMethod


End Class
#tag EndClass
