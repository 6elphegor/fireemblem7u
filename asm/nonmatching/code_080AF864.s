	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AF864
sub_080AF864: @ 0x080AF864
	ldr r0, _080AF88C @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x6d
	bhi _080AF89C
	ldr r3, _080AF890 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080AF894 @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #2
	strh r0, [r3]
	ldr r2, _080AF898 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #2
	b _080AF8B2
	.align 2, 0
_080AF88C: .4byte 0x04000006
_080AF890: .4byte 0x04000008
_080AF894: .4byte 0x0000FFFC
_080AF898: .4byte 0x0400000C
_080AF89C:
	ldr r3, _080AF8B8 @ =0x04000008
	ldrh r2, [r3]
	ldr r1, _080AF8BC @ =0x0000FFFC
	adds r0, r1, #0
	ands r0, r2
	adds r0, #1
	strh r0, [r3]
	ldr r2, _080AF8C0 @ =0x0400000C
	ldrh r0, [r2]
	ands r1, r0
	adds r1, #1
_080AF8B2:
	strh r1, [r2]
	bx lr
	.align 2, 0
_080AF8B8: .4byte 0x04000008
_080AF8BC: .4byte 0x0000FFFC
_080AF8C0: .4byte 0x0400000C
