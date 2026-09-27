	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A0458
sub_080A0458: @ 0x080A0458
	push {lr}
	bl sub_080A0430
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A047C
	ldr r0, _080A0470 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A0474
	movs r0, #0
	b _080A0496
	.align 2, 0
_080A0470: .4byte 0x0202BBF8
_080A0474:
	cmp r0, #3
	bne _080A047C
	movs r0, #2
	b _080A0496
_080A047C:
	ldr r0, _080A0488 @ =0x0202BBF8
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	bne _080A048C
	movs r0, #1
	b _080A0496
	.align 2, 0
_080A0488: .4byte 0x0202BBF8
_080A048C:
	cmp r0, #3
	beq _080A0494
	movs r0, #4
	b _080A0496
_080A0494:
	movs r0, #3
_080A0496:
	pop {r1}
	bx r1
	.align 2, 0
