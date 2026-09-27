	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080593C4
sub_080593C4: @ 0x080593C4
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08059400 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _080593F8
	ldr r1, _08059404 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_080593F8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08059400: .4byte 0x020165C8
_08059404: .4byte 0x0201774C
