	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804172C
sub_0804172C: @ 0x0804172C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08041768 @ =0x0203DC20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08041760
	bl sub_0803DC28
	bl BMapVSync_End
	bl sub_08047CA8
	bl sub_08047DA4
	bl sub_08047F1C
	bl EndLinkArenaButtonSpriteDraw
	bl StartPrepAtMenu
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_08041760:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08041768: .4byte 0x0203DC20
