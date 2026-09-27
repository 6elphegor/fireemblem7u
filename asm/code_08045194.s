	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_08045194
sub_08045194: @ 0x08045194
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080451A8 @ =0x0203D90C
	ldrb r0, [r0]
	cmp r0, #1
	beq _080451AC
	cmp r0, #2
	beq _080451C0
	b _080451EC
	.align 2, 0
_080451A8: .4byte 0x0203D90C
_080451AC:
	ldr r0, _080451B8 @ =0x0202BBF8
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	beq _080451CE
	ldr r0, _080451BC @ =0x08B99FF8
	b _080451D0
	.align 2, 0
_080451B8: .4byte 0x0202BBF8
_080451BC: .4byte 0x08B99FF8
_080451C0:
	ldr r0, _080451D8 @ =0x0202BBF8
	ldr r1, _080451DC @ =0x08B98AEC
	ldr r1, [r1]
	ldrb r0, [r0, #0xf]
	ldrb r1, [r1, #6]
	cmp r0, r1
	bne _080451E4
_080451CE:
	ldr r0, _080451E0 @ =0x08B99D58
_080451D0:
	adds r1, r4, #0
	bl Proc_StartBlocking
	b _080451EC
	.align 2, 0
_080451D8: .4byte 0x0202BBF8
_080451DC: .4byte 0x08B98AEC
_080451E0: .4byte 0x08B99D58
_080451E4:
	ldr r0, _080451F8 @ =0x08B99F08
	adds r1, r4, #0
	bl Proc_StartBlocking
_080451EC:
	adds r0, r4, #0
	bl Proc_Break
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080451F8: .4byte 0x08B99F08
