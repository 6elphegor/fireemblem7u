	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxBlackInOutUnitMain
EfxBlackInOutUnitMain: @ 0x080689CC
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r0, #0x32
	ldrsh r1, [r5, r0]
	movs r4, #0x34
	ldrsh r2, [r5, r4]
	movs r0, #0x2c
	ldrsh r3, [r5, r0]
	movs r4, #0x2e
	ldrsh r0, [r5, r4]
	str r0, [sp]
	movs r0, #0
	bl Interpolate
	adds r6, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08068A24
	ldr r0, _08068A18 @ =0x02000054
	ldr r0, [r0]
	ldr r4, _08068A1C @ =0x02022B40
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r0, _08068A20 @ =0xFFFFFD20
	adds r4, r4, r0
	adds r0, r4, #0
	movs r1, #0x17
	movs r2, #1
	adds r3, r6, #0
	bl EfxPalBlackInOut
	b _08068A42
	.align 2, 0
_08068A18: .4byte 0x02000054
_08068A1C: .4byte 0x02022B40
_08068A20: .4byte 0xFFFFFD20
_08068A24:
	ldr r0, _08068A64 @ =0x02000054
	ldr r0, [r0, #4]
	ldr r4, _08068A68 @ =0x02022B80
	adds r1, r4, #0
	movs r2, #8
	bl CpuFastSet
	ldr r2, _08068A6C @ =0xFFFFFCE0
	adds r4, r4, r2
	adds r0, r4, #0
	movs r1, #0x19
	movs r2, #1
	adds r3, r6, #0
	bl EfxPalBlackInOut
_08068A42:
	bl EnablePalSync
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	ldrh r4, [r5, #0x2e]
	lsls r1, r4, #0x10
	cmp r0, r1
	ble _08068A5C
	adds r0, r5, #0
	bl Proc_Break
_08068A5C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08068A64: .4byte 0x02000054
_08068A68: .4byte 0x02022B80
_08068A6C: .4byte 0xFFFFFCE0
