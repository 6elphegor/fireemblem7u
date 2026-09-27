	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A290C
sub_080A290C: @ 0x080A290C
	ldr r0, _080A2938 @ =0x04000006
	ldrh r0, [r0]
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	ldr r3, _080A293C @ =0x02000508
	cmp r1, #0xa0
	bls _080A2924
	ldr r0, _080A2940 @ =0x02000500
	ldr r0, [r0]
	str r0, [r3]
	movs r1, #0
_080A2924:
	ldr r2, _080A2944 @ =0x04000040
	ldr r0, [r3]
	lsls r1, r1, #2
	adds r1, r1, r0
	ldrh r3, [r1]
	lsls r0, r3, #8
	ldrh r1, [r1, #2]
	adds r0, r1, r0
	strh r0, [r2]
	bx lr
	.align 2, 0
_080A2938: .4byte 0x04000006
_080A293C: .4byte 0x02000508
_080A2940: .4byte 0x02000500
_080A2944: .4byte 0x04000040
