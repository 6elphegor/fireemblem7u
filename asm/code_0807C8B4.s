	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0807C8B4
sub_0807C8B4: @ 0x0807C8B4
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r4, _0807C8F4 @ =0x06013000
	adds r0, r4, #0
	movs r1, #0xe
	bl InitBoxDialogue
	movs r1, #4
	rsbs r1, r1, #0
	ldr r2, _0807C8F8 @ =0x00000FCC
	movs r0, #0xe
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0
	adds r3, r4, #0
	bl StartBoxDialogueExt
	bl GetDialogueBoxConfig
	movs r2, #0xd8
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
_0807C8F4: .4byte 0x06013000
_0807C8F8: .4byte 0x00000FCC
