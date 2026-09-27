	.include "macro.inc"

	.syntax unified

	thumb_func_start EndPrepAtMenuIfNoUnitAvailable
EndPrepAtMenuIfNoUnitAvailable: @ 0x0808E910
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _0808E97C @ =0x03002870
	movs r0, #2
	rsbs r0, r0, #0
	ldrb r1, [r2, #1]
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r4, #1
_0808E936:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _0808E95A
	ldr r0, [r1]
	cmp r0, #0
	beq _0808E95A
	adds r0, r1, #0
	bl IsUnitInCurrentRoster
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0808E95A
	adds r0, r5, #1
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
_0808E95A:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808E936
	cmp r5, #0
	bne _0808E974
	adds r1, r6, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	adds r0, r6, #0
	movs r1, #6
	bl Proc_Goto
_0808E974:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808E97C: .4byte 0x03002870
