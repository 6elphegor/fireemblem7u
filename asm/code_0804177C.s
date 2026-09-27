	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804177C
sub_0804177C: @ 0x0804177C
	adds r3, r0, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	ldr r2, _080417B8 @ =0x00004060
	adds r0, r0, r2
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r1, #2
	ble _08041798
	movs r1, #0x80
	lsls r1, r1, #5
	adds r0, r2, r1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
_08041798:
	strh r2, [r3]
	adds r0, r2, #1
	strh r0, [r3, #2]
	adds r0, r2, #2
	strh r0, [r3, #4]
	adds r1, r3, #0
	adds r1, #0x40
	adds r0, #0x1e
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	adds r1, #2
	adds r0, #1
	strh r0, [r1]
	bx lr
	.align 2, 0
_080417B8: .4byte 0x00004060
