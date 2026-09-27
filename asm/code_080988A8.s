	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080988A8
sub_080988A8: @ 0x080988A8
	push {r4, lr}
	sub sp, #8
	movs r0, #0
	bl SetTextFont
	ldr r4, _080988FC @ =0x02022CC8
	adds r0, r4, #0
	movs r1, #0xc
	movs r2, #1
	movs r3, #0
	bl TmFillRect_thm
	ldr r0, _08098900 @ =0x0000125A
	bl DecodeMsg
	ldr r3, _08098904 @ =0x02012B68
	adds r1, r4, #0
	adds r1, #0xda
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r3, #0
	movs r3, #2
	bl PutDrawText
	subs r4, #0x26
	movs r2, #0x9c
	lsls r2, r2, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0x4a
	adds r1, r4, #0
	movs r3, #2
	bl PutFaceChibi
	movs r0, #1
	bl EnableBgSync
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080988FC: .4byte 0x02022CC8
_08098900: .4byte 0x0000125A
_08098904: .4byte 0x02012B68
