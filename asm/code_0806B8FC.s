	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0806B8FC
sub_0806B8FC: @ 0x0806B8FC
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0806B920 @ =0x02022860
	ldr r1, _0806B924 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x10
	strh r0, [r4, #0x2e]
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806B920: .4byte 0x02022860
_0806B924: .4byte 0x020165C8
