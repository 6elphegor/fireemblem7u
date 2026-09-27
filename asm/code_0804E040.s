	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804E040
sub_0804E040: @ 0x0804E040
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0804E0AC @ =0x0201774C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E072
	ldr r0, _0804E0B0 @ =0x0201772C
	ldr r0, [r0]
	cmp r0, #0
	bne _0804E072
	ldr r4, _0804E0B4 @ =0x0201FAF8
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #1
	bne _0804E072
	movs r6, #1
_0804E072:
	cmp r6, #1
	bne _0804E0A6
	movs r0, #7
	strh r0, [r5, #0x2c]
	ldr r0, _0804E0B8 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0804E0A0
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	ldr r1, _0804E0BC @ =0x02017744
	ldr r1, [r1]
	cmp r0, r1
	beq _0804E0A0
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r7, #0
	bl NewEfxFarAttackWithDistance
	movs r0, #0
	strh r0, [r5, #0x2c]
_0804E0A0:
	adds r0, r5, #0
	bl Proc_Break
_0804E0A6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E0AC: .4byte 0x0201774C
_0804E0B0: .4byte 0x0201772C
_0804E0B4: .4byte 0x0201FAF8
_0804E0B8: .4byte 0x0203E02C
_0804E0BC: .4byte 0x02017744
