	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804F5D4
sub_0804F5D4: @ 0x0804F5D4
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	blt _0804F632
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _0804F60C
	ldr r0, _0804F604 @ =0x081D97D0
	ldr r1, _0804F608 @ =0x02022B40
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdateFlashingUnit
	b _0804F61C
	.align 2, 0
_0804F604: .4byte 0x081D97D0
_0804F608: .4byte 0x02022B40
_0804F60C:
	ldr r0, _0804F638 @ =0x081D97D0
	ldr r1, _0804F63C @ =0x02022B80
	movs r2, #8
	bl CpuFastSet
	ldr r0, [r4, #0x5c]
	bl EkrDragonUpdateFlashingUnit
_0804F61C:
	bl EnablePalSync
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	movs r2, #0x30
	ldrsh r0, [r4, r2]
	cmp r1, r0
	blt _0804F632
	adds r0, r4, #0
	bl Proc_Break
_0804F632:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804F638: .4byte 0x081D97D0
_0804F63C: .4byte 0x02022B80
