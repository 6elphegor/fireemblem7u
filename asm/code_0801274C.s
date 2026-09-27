	.include "macro.inc"

	.syntax unified

	thumb_func_start GC_PostIntro
GC_PostIntro: @ 0x0801274C
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	cmp r1, #1
	beq _08012786
	cmp r1, #1
	bgt _08012762
	cmp r1, #0
	beq _08012776
	b _080127BC
_08012762:
	cmp r1, #2
	beq _0801276C
	cmp r1, #3
	beq _080127B4
	b _080127BC
_0801276C:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080127BC
_08012776:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	bl sub_08012738
	b _080127BC
_08012786:
	adds r0, r4, #0
	adds r0, #0x2b
	ldrb r2, [r0]
	ands r1, r2
	adds r5, r0, #0
	cmp r1, #0
	beq _0801279A
	cmp r1, #1
	beq _080127A4
	b _080127AC
_0801279A:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	b _080127AC
_080127A4:
	adds r0, r4, #0
	movs r1, #0
	bl Proc_Goto
_080127AC:
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
	b _080127BC
_080127B4:
	adds r0, r4, #0
	movs r1, #0x15
	bl Proc_Goto
_080127BC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
