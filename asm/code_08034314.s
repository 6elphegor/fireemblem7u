	.include "macro.inc"

	.syntax unified

	thumb_func_start ApplyTrapDamageAnim
ApplyTrapDamageAnim: @ 0x08034314
	push {r4, lr}
	ldr r4, [r0, #0x54]
	adds r0, #0x50
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	beq _08034338
	cmp r0, #1
	bgt _0803432C
	cmp r0, #0
	beq _08034332
	b _0803435A
_0803432C:
	cmp r0, #2
	beq _08034350
	b _0803435A
_08034332:
	bl EndAllMus
	b _0803435A
_08034338:
	bl EndAllMus
	ldr r0, _0803434C @ =0x03004690
	ldr r0, [r0]
	bl StartMu
	bl MU_SetDefaultFacing_Auto
	b _0803435A
	.align 2, 0
_0803434C: .4byte 0x03004690
_08034350:
	adds r0, r4, #0
	bl GetUnitMu
	bl EndMu
_0803435A:
	ldr r1, _08034370 @ =0x0203A85C
	movs r0, #0xa
	strb r0, [r1, #0x15]
	adds r0, r4, #0
	movs r1, #0xa
	bl BeginUnitCritDamageAnim
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08034370: .4byte 0x0203A85C
