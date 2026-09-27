	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterTitleNameTsa
PutChapterTitleNameTsa: @ 0x08082440
	adds r2, r0, #0
	ldr r0, _0808245C @ =0x0203E698
	lsls r1, r1, #0xc
	ldrh r0, [r0, #2]
	adds r0, r0, r1
	movs r1, #0x3f
_0808244C:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0808244C
	bx lr
	.align 2, 0
_0808245C: .4byte 0x0203E698
