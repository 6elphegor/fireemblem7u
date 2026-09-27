	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterTitleUnkBG
PutChapterTitleUnkBG: @ 0x08082410
	push {lr}
	adds r1, r0, #0
	ldr r3, _08082434 @ =0x0203E698
	ldr r0, _08082438 @ =0x000003FF
	adds r2, r0, #0
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3]
	ldr r0, _0808243C @ =0x08401C2C
	lsls r1, r1, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r1, r2
	bl Decompress
	pop {r0}
	bx r0
	.align 2, 0
_08082434: .4byte 0x0203E698
_08082438: .4byte 0x000003FF
_0808243C: .4byte 0x08401C2C
