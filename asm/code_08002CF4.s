	.include "macro.inc"

	.syntax unified

	thumb_func_start SoftResetIfKeyCombo
SoftResetIfKeyCombo: @ 0x08002CF4
	push {r7, lr}
	mov r7, sp
	bl sub_08002CA4
	lsls r1, r0, #0x18
	asrs r0, r1, #0x18
	cmp r0, #0
	beq _08002D40
	ldr r1, _08002D1C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	ldr r0, _08002D20 @ =0x00000303
	cmp r1, r0
	bne _08002D24
	bl sub_08002C8C
	movs r0, #0xfe
	bl SoftReset
	b _08002D40
	.align 2, 0
_08002D1C: .4byte 0x08B857F8
_08002D20: .4byte 0x00000303
_08002D24:
	ldr r1, _08002D3C @ =0x08B857F8
	ldr r0, [r1]
	ldrh r1, [r0, #4]
	cmp r1, #0xf
	bne _08002D40
	bl sub_08002C8C
	movs r0, #0xfe
	bl SoftReset
	b _08002D40
	.align 2, 0
_08002D3C: .4byte 0x08B857F8
_08002D40:
	pop {r7}
	pop {r0}
	bx r0
	.align 2, 0
