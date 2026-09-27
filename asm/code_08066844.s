	.include "macro.inc"

	.syntax unified

	thumb_func_start EkrDragonScreenFlashing_Loop2
EkrDragonScreenFlashing_Loop2: @ 0x08066844
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08066894 @ =0x02022860
	ldr r4, _08066898 @ =0x020165C8
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
	asrs r0, r0, #0x10
	ldr r1, [r6, #0x48]
	cmp r0, r1
	ble _0806688E
	movs r0, #0
	strh r0, [r6, #0x2c]
	adds r0, r6, #0
	bl Proc_Break
_0806688E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066894: .4byte 0x02022860
_08066898: .4byte 0x020165C8
