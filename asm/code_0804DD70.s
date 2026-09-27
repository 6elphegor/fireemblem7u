	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804DD70
sub_0804DD70: @ 0x0804DD70
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r6, [r5, #0x60]
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804DDCE
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bne _0804DDCE
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0804DE04 @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	ldr r4, _0804DE08 @ =0x00000395
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r4, #0
	bl EfxPlaySE
	movs r0, #2
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	movs r2, #1
	bl M4aPlayWithPostionCtrl
	movs r2, #0x2e
	ldrsh r1, [r5, r2]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804DDCE
	movs r0, #1
	str r0, [r5, #0x58]
_0804DDCE:
	ldr r1, [r5, #0x54]
	cmp r1, #0x1e
	bne _0804DE14
	ldr r0, [r5, #0x58]
	cmp r0, #1
	bne _0804DE14
	ldr r4, _0804DE0C @ =0x0203E05E
	adds r0, r6, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	adds r0, r6, #0
	bl GetAnimPosition
	ldr r1, _0804DE10 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _0804DE20
	.align 2, 0
_0804DE04: .4byte 0x0203E0B8
_0804DE08: .4byte 0x00000395
_0804DE0C: .4byte 0x0203E05E
_0804DE10: .4byte 0x02017780
_0804DE14:
	adds r0, r1, #1
	str r0, [r5, #0x54]
	cmp r0, #0x1d
	bls _0804DE20
	movs r0, #0x1e
	str r0, [r5, #0x54]
_0804DE20:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
