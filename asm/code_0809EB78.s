	.include "macro.inc"

	.syntax unified

	thumb_func_start sub_0809EB78
sub_0809EB78: @ 0x0809EB78
	push {r4, lr}
	ldr r4, _0809EBB4 @ =0x02020140
	adds r0, r4, #0
	bl LoadBonusContentData
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809EBB8
	movs r3, #0
	adds r1, r4, #0
	movs r2, #0x1f
_0809EB8E:
	ldrb r0, [r1]
	cmp r0, #0
	beq _0809EBA2
	ldrb r0, [r1, #1]
	cmp r0, #0
	bne _0809EB9C
	movs r3, #1
_0809EB9C:
	cmp r0, #2
	bne _0809EBA2
	movs r3, #1
_0809EBA2:
	adds r1, #0x14
	subs r2, #1
	cmp r2, #0
	bge _0809EB8E
	cmp r3, #0
	beq _0809EBB8
	movs r0, #1
	b _0809EBBA
	.align 2, 0
_0809EBB4: .4byte 0x02020140
_0809EBB8:
	movs r0, #0
_0809EBBA:
	pop {r4}
	pop {r1}
	bx r1
