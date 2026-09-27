	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807CA44
sub_0807CA44: @ 0x0807CA44
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl ClearTalk
	movs r0, #0
	bl InitBgs
	ldr r2, _0807CAB4 @ =0x03002870
	adds r1, r2, #0
	adds r1, #0x3c
	movs r0, #0x3f
	ldrb r3, [r1]
	ands r0, r3
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x44
	movs r1, #0
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r1, r2, #0
	adds r1, #0x46
	movs r0, #0x10
	strb r0, [r1]
	bl ApplySystemObjectsGraphics
	ldr r4, _0807CAB8 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	ldr r2, _0807CABC @ =0x00000FCB
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	movs r1, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetDialogueBoxConfig
	movs r2, #0x88
	lsls r2, r2, #1
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl SetDialogueBoxConfig
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0807CAB4: .4byte 0x03002870
_0807CAB8: .4byte 0x06013000
_0807CABC: .4byte 0x00000FCB
