	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrLvup_InitPalette
EkrLvup_InitPalette: @ 0x08069404
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x50
	ble _0806943A
	strh r1, [r4, #0x2c]
	str r1, [r4, #0x44]
	str r1, [r4, #0x48]
	movs r0, #2
	rsbs r0, r0, #0
	str r0, [r4, #0x4c]
	subs r0, #2
	str r0, [r4, #0x50]
	ldr r0, _08069440 @ =0x02022860
	ldr r1, _08069444 @ =0x020165C8
	movs r2, #0x80
	lsls r2, r2, #1
	bl CpuFastSet
	adds r0, r4, #0
	bl Proc_Break
_0806943A:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08069440: .4byte 0x02022860
_08069444: .4byte 0x020165C8
