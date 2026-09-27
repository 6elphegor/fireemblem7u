	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080715B0
sub_080715B0: @ 0x080715B0
	push {r4, r5, r6, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, _080715FC @ =0x083F4464
	ldr r1, _08071600 @ =0x06013000
	bl Decompress
	ldr r0, _08071604 @ =0x083F46F0
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08071608 @ =0x083EDA80
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	adds r2, #0x10
	movs r3, #0xc6
	lsls r3, r3, #6
	ldr r5, [r7]
	adds r4, r5, #0
	adds r5, #0x48
	movs r6, #0
	ldrsh r4, [r5, r6]
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080715FC: .4byte 0x083F4464
_08071600: .4byte 0x06013000
_08071604: .4byte 0x083F46F0
_08071608: .4byte 0x083EDA80
