	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_080A1E8C
sub_080A1E8C: @ 0x080A1E8C
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	movs r0, #5
	bl GetSaveReadAddr
	adds r7, r0, #0
	ldr r1, _080A1EE0 @ =0x03005E70
	movs r0, #0xc8
	mov r4, r8
	muls r4, r0, r4
	adds r0, r7, r4
	ldr r3, [r1]
	adds r1, r5, #0
	movs r2, #0xa
	bl _call_via_r3
	adds r4, #0x14
	adds r4, r7, r4
	movs r5, #4
_080A1EBA:
	adds r0, r4, #0
	adds r1, r6, #0
	bl LoadSavedUnit
	adds r6, #0x48
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A1EBA
	movs r0, #0xc8
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	adds r0, r7, r0
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A1EE4
	movs r0, #1
	b _080A1EE6
	.align 2, 0
_080A1EE0: .4byte 0x03005E70
_080A1EE4:
	movs r0, #0
_080A1EE6:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
