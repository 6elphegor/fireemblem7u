	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08073200
sub_08073200: @ 0x08073200
	push {r4, r7, lr}
	sub sp, #0xc
	add r7, sp, #8
	str r0, [r7]
	ldr r0, [r7]
	ldr r1, [r0, #0x30]
	movs r0, #0x85
	bl PlaySeSpacial
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl SetBgOffset
	bl SetDefaultManimScreenConf
	ldr r0, _08073258 @ =0x08275FB0
	ldr r1, _0807325C @ =0x06013800
	bl Decompress
	ldr r0, _08073260 @ =0x08276198
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl ApplyPaletteExt
	ldr r0, _08073264 @ =0x083F83B4
	ldr r2, [r7]
	ldr r1, [r2, #0x30]
	ldr r2, [r7]
	ldr r3, [r2, #0x34]
	adds r2, r3, #0
	subs r2, #0x10
	ldr r3, _08073268 @ =0x000041C0
	movs r4, #0
	str r4, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl StartSpriteAnimProc
	add sp, #0xc
	pop {r4, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08073258: .4byte 0x08275FB0
_0807325C: .4byte 0x06013800
_08073260: .4byte 0x08276198
_08073264: .4byte 0x083F83B4
_08073268: .4byte 0x000041C0
