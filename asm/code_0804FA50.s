	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxWeaponIcon
NewEfxWeaponIcon: @ 0x0804FA50
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r0, _0804FA8C @ =0x08B9AF3C
	movs r1, #3
	bl Proc_Start
	movs r2, #0
	strh r2, [r0, #0x2c]
	str r2, [r0, #0x44]
	ldr r1, _0804FA90 @ =0x081D8406
	str r1, [r0, #0x48]
	str r2, [r0, #0x4c]
	str r2, [r0, #0x50]
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	str r4, [r0, #0x54]
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	str r5, [r0, #0x58]
	ldr r1, _0804FA94 @ =0x02017774
	str r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804FA8C: .4byte 0x08B9AF3C
_0804FA90: .4byte 0x081D8406
_0804FA94: .4byte 0x02017774
