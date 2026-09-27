	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080AE9C0
sub_080AE9C0: @ 0x080AE9C0
	push {r4, lr}
	adds r4, r0, #0
	bl EndMuralBackground
	ldr r0, _080AE9E4 @ =0x08CE5BB8
	bl Proc_EndEach
	ldr r0, _080AE9E8 @ =0x08CE5B98
	bl Proc_EndEach
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AE9EC
	movs r0, #1
	b _080AE9FC
	.align 2, 0
_080AE9E4: .4byte 0x08CE5BB8
_080AE9E8: .4byte 0x08CE5B98
_080AE9EC:
	adds r0, r4, #0
	bl StartUnitListScreenForSoloAnim
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
	movs r0, #0
_080AE9FC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
