	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0804D94C
sub_0804D94C: @ 0x0804D94C
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, [r5, #0x58]
	cmp r1, #0
	bne _0804D99C
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	bne _0804D99C
	strh r1, [r5, #0x2c]
	ldr r0, [r5, #0x48]
	ldrh r1, [r5, #0x2e]
	adds r0, r1, r0
	strh r0, [r5, #0x2e]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D9E8 @ =0x0203E0B8
	lsls r0, r0, #1
	adds r0, r0, r1
	ldr r1, [r5, #0x48]
	ldrh r2, [r0]
	adds r1, r2, r1
	strh r1, [r0]
	movs r0, #0x2e
	ldrsh r1, [r5, r0]
	ldr r0, [r5, #0x50]
	cmp r1, r0
	bne _0804D99C
	movs r0, #1
	str r0, [r5, #0x58]
_0804D99C:
	ldr r0, [r5, #0x54]
	cmp r0, #0x54
	bne _0804D9F8
	ldr r6, [r5, #0x58]
	cmp r6, #1
	bne _0804D9F8
	ldr r4, _0804D9EC @ =0x0203E05E
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	ldrh r1, [r0]
	adds r1, #1
	movs r4, #0
	strh r1, [r0]
	ldr r0, [r5, #0x60]
	bl GetAnimPosition
	ldr r1, _0804D9F0 @ =0x02017780
	lsls r0, r0, #1
	adds r0, r0, r1
	strh r4, [r0]
	ldr r0, [r5, #0x50]
	cmp r0, #0
	bne _0804D9D6
	adds r0, r5, #0
	adds r0, #0x29
	strb r6, [r0]
_0804D9D6:
	strh r4, [r5, #0x2c]
	movs r0, #0xa
	strh r0, [r5, #0x2e]
	ldr r0, _0804D9F4 @ =0x02017750
	str r6, [r0]
	adds r0, r5, #0
	bl Proc_Break
	b _0804DA04
	.align 2, 0
_0804D9E8: .4byte 0x0203E0B8
_0804D9EC: .4byte 0x0203E05E
_0804D9F0: .4byte 0x02017780
_0804D9F4: .4byte 0x02017750
_0804D9F8:
	adds r0, #1
	str r0, [r5, #0x54]
	cmp r0, #0x53
	bls _0804DA04
	movs r0, #0x54
	str r0, [r5, #0x54]
_0804DA04:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
