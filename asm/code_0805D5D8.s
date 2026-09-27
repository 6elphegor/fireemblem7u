	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0805D5D8
sub_0805D5D8: @ 0x0805D5D8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	ldrh r2, [r4, #0x2e]
	lsls r1, r2, #0x10
	cmp r0, r1
	bne _0805D696
	movs r0, #0
	strh r0, [r4, #0x2c]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	bne _0805D63E
	ldr r0, _0805D620 @ =0x08BBFC5C
	mov r8, r0
	ldr r7, _0805D624 @ =0x08BC125C
	ldr r0, _0805D628 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D62C
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x88
	cmp r0, #0
	bne _0805D63A
	movs r5, #0x68
	b _0805D63A
	.align 2, 0
_0805D620: .4byte 0x08BBFC5C
_0805D624: .4byte 0x08BC125C
_0805D628: .4byte 0x0203E02C
_0805D62C:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x70
	cmp r0, #0
	bne _0805D63A
	movs r5, #0x80
_0805D63A:
	movs r6, #0x4e
	b _0805D67C
_0805D63E:
	ldr r2, _0805D660 @ =0x08BBFCD0
	mov r8, r2
	ldr r7, _0805D664 @ =0x08BC12D0
	ldr r0, _0805D668 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0805D66C
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x4c
	cmp r0, #0
	bne _0805D67A
	movs r5, #0xa4
	b _0805D67A
	.align 2, 0
_0805D660: .4byte 0x08BBFCD0
_0805D664: .4byte 0x08BC12D0
_0805D668: .4byte 0x0203E02C
_0805D66C:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	movs r5, #0x64
	cmp r0, #0
	bne _0805D67A
	movs r5, #0x8c
_0805D67A:
	movs r6, #0x40
_0805D67C:
	ldr r0, [r4, #0x5c]
	mov r2, r8
	str r2, [sp]
	adds r1, r7, #0
	adds r3, r7, #0
	bl EfxCreateFrontAnim
	str r0, [r4, #0x60]
	strh r5, [r0, #2]
	strh r6, [r0, #4]
	adds r0, r4, #0
	bl Proc_Break
_0805D696:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
