#tag Class
Protected Class BlurHashCanvas
Inherits Canvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  If mDecodedPicture = Nil Or mHash = "" Then
		    g.ClearRectangle(0, 0, g.Width, g.Height)
		    Return
		  End If
		  
		  If mPreviousSize.Left <> g.Width Or mPreviousSize.Right <> g.Height Then
		    mPreviousSize = g.Width : g.Height
		    ResetBackgroundWorker
		  End If
		  
		  g.DrawPicture(mDecodedPicture, 0, 0, g.Width, g.Height, 0, 0, mDecodedPicture.Width, mDecodedPicture.Height)
		  Paint(g, areas)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  mPreviousSize = 0 : 0
		  mDecoder = New BlurHash.Decoder
		  mBackgroundWorker = New BlurHashThread
		  mBackgroundWorker.Priority = Thread.LowestPriority
		  AddHandler mBackgroundWorker.UserInterfaceUpdate, WeakAddressOf ThreadUpdateHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetBackgroundWorker()
		  Const kDecreaseQuality = 10
		  mBackgroundWorker.Stop
		  If mHash <> "" And mHash.Length >= 6 Then
		    Var ratio As Double = Min(30, Width) / Width
		    mDecodedPicture = mDecoder.Decode(mHash, Width * ratio, Height * ratio)
		    mBackgroundWorker.Hash = mHash
		    mBackgroundWorker.Width = Width / kDecreaseQuality
		    mBackgroundWorker.Height = Height / kDecreaseQuality
		    mBackgroundWorker.Start
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ThreadUpdateHandler(sender As BlurHashThread, updates() As Dictionary)
		  Var update As Dictionary = updates(updates.LastIndex)
		  mDecodedPicture = update.Value("result")
		  Invalidate
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Paint(g As Graphics, areas() As REALbasic.Rect)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mHash
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mHash = value Then Return
			  mHash = value
			  ResetBackgroundWorker
			  Invalidate
			End Set
		#tag EndSetter
		Hash As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mBackgroundWorker As BlurHashThread
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDecodedPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDecoder As BlurHash.Decoder
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHash As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousSize As Pair
	#tag EndProperty


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
			InitialValue=""
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
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hash"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
