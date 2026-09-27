	.include "macro.inc"

	.syntax unified

	thumb_func_start CgText_808F04C
CgText_808F04C: @ 0x08087B20
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08087B54 @ =0x08B857F8
	ldr r1, [r0]
	movs r0, #0xa
	ldrh r1, [r1, #8]
	ands r0, r1
	cmp r0, #0
	beq _08087B4E
	bl GetCgTextFlags
	movs r1, #0x40
	ands r1, r0
	cmp r1, #0
	bne _08087B4E
	bl sub_0800F08C
	bl EndCgTextInterpreter
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_08087B4E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08087B54: .4byte 0x08B857F8
