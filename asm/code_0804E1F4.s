	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxDead
NewEfxDead: @ 0x0804E1F4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _0804E228 @ =0x02017728
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r1, _0804E22C @ =0x02017734
	movs r0, #1
	str r0, [r1]
	ldr r0, _0804E230 @ =0x08B9AD1C
	movs r1, #3
	bl Proc_Start
	str r4, [r0, #0x5c]
	str r5, [r0, #0x60]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	adds r0, r4, #0
	bl DisableEfxStatusUnits
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E228: .4byte 0x02017728
_0804E22C: .4byte 0x02017734
_0804E230: .4byte 0x08B9AD1C
