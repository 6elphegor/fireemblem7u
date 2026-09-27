	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804F254
sub_0804F254: @ 0x0804F254
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F290
	ldr r0, _0804F274 @ =0x0203E0B8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x50
	bgt _0804F280
	ldr r0, _0804F278 @ =0x081D9630
	ldr r1, _0804F27C @ =0x02022BC0
	b _0804F29E
	.align 2, 0
_0804F274: .4byte 0x0203E0B8
_0804F278: .4byte 0x081D9630
_0804F27C: .4byte 0x02022BC0
_0804F280:
	ldr r0, _0804F288 @ =0x081D9730
	ldr r1, _0804F28C @ =0x02022BC0
	b _0804F29E
	.align 2, 0
_0804F288: .4byte 0x081D9730
_0804F28C: .4byte 0x02022BC0
_0804F290:
	ldr r0, _0804F2A8 @ =0x0203E0B8
	movs r2, #2
	ldrsh r0, [r0, r2]
	cmp r0, #0x50
	bgt _0804F2B4
	ldr r0, _0804F2AC @ =0x081D9630
	ldr r1, _0804F2B0 @ =0x02022BE0
_0804F29E:
	movs r2, #0x10
	bl CpuSet
	b _0804F2BE
	.align 2, 0
_0804F2A8: .4byte 0x0203E0B8
_0804F2AC: .4byte 0x081D9630
_0804F2B0: .4byte 0x02022BE0
_0804F2B4:
	ldr r0, _0804F2E0 @ =0x081D9730
	ldr r1, _0804F2E4 @ =0x02022BE0
	movs r2, #0x10
	bl CpuSet
_0804F2BE:
	bl EnablePalSync
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x30]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F2D8
	adds r0, r4, #0
	bl Proc_Break
_0804F2D8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F2E0: .4byte 0x081D9730
_0804F2E4: .4byte 0x02022BE0
