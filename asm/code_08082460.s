	.include "macro.inc"

	.syntax unified

	thumb_func_start PutChapterTitleBgTsa
PutChapterTitleBgTsa: @ 0x08082460
	adds r2, r0, #0
	ldr r0, _0808247C @ =0x0203E698
	lsls r1, r1, #0xc
	ldrh r0, [r0]
	adds r0, r0, r1
	movs r1, #0x7f
_0808246C:
	strh r0, [r2]
	adds r0, #1
	adds r2, #2
	subs r1, #1
	cmp r1, #0
	bge _0808246C
	bx lr
	.align 2, 0
_0808247C: .4byte 0x0203E698
