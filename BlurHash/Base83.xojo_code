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
		  
		  Var value As Integer = 0
		  Var chars() As String = Input.Split("")
		  
		  For Each c As String In chars
		    Var digit As Integer = alphabet.indexOf(c)
		    value = value * 83 + digit
		  Next
		  
		  Return value
		End Function
	#tag EndMethod


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
