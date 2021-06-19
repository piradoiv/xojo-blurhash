#tag Class
Protected Class Base83
	#tag Method, Flags = &h0
		Function Decode(input As String) As Integer
		  #Pragma BackgroundTasks False
		  Var value As Integer = 0
		  For Each c As String In Input.Characters
		    value = value * 83 + kAlphabet.indexOf(c)
		  Next
		  #Pragma BackgroundTasks True
		  
		  Return value
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
