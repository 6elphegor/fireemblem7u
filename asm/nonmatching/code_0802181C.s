	.include "macro.inc"

	.syntax unified

	thumb_func_start DropUsability
DropUsability: @ 0x0802181C
	push {lr}
	ldr r0, _08021848 @ =0x03004690
	ldr r2, [r0]
	ldr r1, [r2, #0xc]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802184C
	movs r0, #0x10
	ands r1, r0
	cmp r1, #0
	beq _0802184C
	adds r0, r2, #0
	bl MakeDropTargetList
	bl CountTargets
	cmp r0, #0
	beq _0802184C
	movs r0, #1
	b _0802184E
	.align 2, 0
_08021848: .4byte 0x03004690
_0802184C:
	movs r0, #3
_0802184E:
	pop {r1}
	bx r1
	.align 2, 0
