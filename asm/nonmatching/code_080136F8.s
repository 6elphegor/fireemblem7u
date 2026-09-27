	.include "macro.inc"

	.syntax unified

	thumb_func_start ArchivePalette
ArchivePalette: @ 0x080136F8
	push {r4, lr}
	adds r4, r0, #0
	bl GetPalFadeSt
	lsls r2, r4, #5
	ldr r1, _08013724 @ =0x02022860
	adds r2, r2, r1
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #4
	adds r1, r1, r0
	movs r3, #0xf
_08013710:
	ldrh r0, [r2]
	strh r0, [r1]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08013710
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013724: .4byte 0x02022860
