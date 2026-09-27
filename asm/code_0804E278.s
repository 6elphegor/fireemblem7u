	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E278
sub_0804E278: @ 0x0804E278
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, [r4, #0x5c]
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0x1e
	bne _0804E2BE
	adds r0, r5, #0
	bl CheckEfxDragonDeadFallHead
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804E2DA
	ldr r0, [r4, #0x5c]
	ldr r1, [r4, #0x60]
	bl sub_0804E36C
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xd6
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r5, r0]
	movs r0, #0xd6
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r0, #0x32
	strh r0, [r4, #0x2e]
	b _0804E2DA
_0804E2BE:
	movs r2, #0x2e
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _0804E2DA
	ldr r1, _0804E2E0 @ =0x02017728
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	ldr r1, _0804E2E4 @ =0x02017734
	movs r0, #0
	str r0, [r1]
	adds r0, r4, #0
	bl Proc_Break
_0804E2DA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804E2E0: .4byte 0x02017728
_0804E2E4: .4byte 0x02017734
