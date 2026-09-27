	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A7860
sub_080A7860: @ 0x080A7860
	adds r1, r0, #0
	adds r1, #0xd
	lsls r1, r1, #5
	ldr r2, _080A7888 @ =0x02022A62
	adds r3, r1, r2
	ldr r2, _080A788C @ =0x0201E9F4
	lsls r1, r0, #4
	subs r1, r1, r0
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r2, #0xe
_080A7876:
	ldrh r0, [r3]
	strh r0, [r1]
	adds r3, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080A7876
	bx lr
	.align 2, 0
_080A7888: .4byte 0x02022A62
_080A788C: .4byte 0x0201E9F4
