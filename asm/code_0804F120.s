	.include "macro.inc"

	.syntax unified

	thumb_func_start EfxWhiteOutMain1
EfxWhiteOutMain1: @ 0x0804F120
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _0804F170 @ =0x02022860
	ldr r4, _0804F174 @ =0x020165C8
	movs r5, #0x80
	lsls r5, r5, #1
	adds r1, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0x10
	bl EfxPalWhiteInOut
	movs r1, #0xa0
	lsls r1, r1, #0x13
	adds r0, r4, #0
	adds r2, r5, #0
	bl CpuFastSet
	bl DisablePalSync
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r6, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	ble _0804F16A
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0804F16A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804F170: .4byte 0x02022860
_0804F174: .4byte 0x020165C8
