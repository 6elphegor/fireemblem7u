	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08022BC0
sub_08022BC0: @ 0x08022BC0
	push {r4, lr}
	ldr r4, _08022BF0 @ =0x03004690
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _08022BEC
	adds r0, r2, #0
	bl MakeTargetListForSupport
	bl CountTargets
	cmp r0, #0
	beq _08022BEC
	ldr r0, [r4]
	bl MakeTalkTargetList
	bl CountTargets
	cmp r0, #0
	beq _08022BF4
_08022BEC:
	movs r0, #3
	b _08022C08
	.align 2, 0
_08022BF0: .4byte 0x03004690
_08022BF4:
	ldr r1, [r4]
	adds r1, #0x30
	movs r0, #0xf
	ldrb r1, [r1]
	ands r0, r1
	cmp r0, #3
	beq _08022C06
	movs r0, #1
	b _08022C08
_08022C06:
	movs r0, #2
_08022C08:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
