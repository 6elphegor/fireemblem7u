	.include "macro.inc"

	.syntax unified

	thumb_func_start SetEkrFrontAnimPostion
SetEkrFrontAnimPostion: @ 0x080507D8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	cmp r0, #0
	bne _080507F4
	ldr r0, _080507F0 @ =0x02000000
	ldr r3, [r0]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #4]
	b _080507FE
	.align 2, 0
_080507F0: .4byte 0x02000000
_080507F4:
	ldr r0, _08050804 @ =0x02000000
	ldr r3, [r0, #8]
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	ldr r3, [r0, #0xc]
_080507FE:
	strh r1, [r3, #2]
	strh r2, [r3, #4]
	bx lr
	.align 2, 0
_08050804: .4byte 0x02000000
