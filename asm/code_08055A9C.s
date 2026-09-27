	.include "macro.inc"

	.syntax unified

	thumb_func_start NewEfxRestWIN
NewEfxRestWIN: @ 0x08055A9C
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	adds r4, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r1, _08055AE4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08055AE8 @ =0x08BA153C
	movs r1, #3
	bl Proc_Start
	adds r7, r0, #0
	mov r0, r8
	str r0, [r7, #0x5c]
	movs r1, #0
	mov sb, r1
	movs r0, #0
	strh r0, [r7, #0x2c]
	strh r0, [r7, #0x2e]
	str r4, [r7, #0x44]
	str r5, [r7, #0x54]
	str r6, [r7, #0x58]
	mov r0, r8
	bl GetAnimAnotherSide
	bl GetAnimPosition
	cmp r0, #0
	bne _08055AF0
	ldr r0, _08055AEC @ =0x0000FFB8
	b _08055AF2
	.align 2, 0
_08055AE4: .4byte 0x0201774C
_08055AE8: .4byte 0x08BA153C
_08055AEC: .4byte 0x0000FFB8
_08055AF0:
	ldr r0, _08055B10 @ =0x0000FFF8
_08055AF2:
	strh r0, [r7, #0x32]
	ldr r0, _08055B14 @ =0x0203E02C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08055B1E
	mov r0, r8
	bl GetAnimPosition
	cmp r0, #0
	bne _08055B18
	ldrh r0, [r7, #0x32]
	adds r0, #0x18
	b _08055B1C
	.align 2, 0
_08055B10: .4byte 0x0000FFF8
_08055B14: .4byte 0x0203E02C
_08055B18:
	ldrh r0, [r7, #0x32]
	subs r0, #0x18
_08055B1C:
	strh r0, [r7, #0x32]
_08055B1E:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
